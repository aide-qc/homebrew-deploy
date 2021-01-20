import json, os, subprocess, hashlib, wget

# goals here...

# store previous shasums as a json string
# { "xacc": { 
#        "source":"SHASUM",
#        "catalina":...etc
#    }, 
#   "qcor" : {... same ...}
#}
 
def compute_sha256sum(filename):
    with open(filename,"rb") as f:
        bytes = f.read() 
        return hashlib.sha256(bytes).hexdigest()
        
# load previous json shasum file, $HOME/.cache_shasums.json
def load_json_file(filename: str):
    with open(filename) as f_in:
        return json.load(f_in)

def run_command_silent(cwd, command, *args):
    commands = [command] + list(args)
    try:
        result = subprocess.run(commands, cwd=cwd, check=True, stdout=open(os.devnull, 'wb'))
    except subprocess.CalledProcessError as e:
        print(e.output)
        print(e.returncode)
        return e.returncode

def run_command(cwd, command, *args):
    commands = [command] + list(args)
    try:
        result = subprocess.run(commands, cwd=cwd, check=True)
    except subprocess.CalledProcessError as e:
        print(e.output)
        print(e.returncode)
        return e.returncode

cache_file_name = os.getenv('HOME')+'/.cached_shasums.json'
cached_sums = load_json_file(cache_file_name)

print(cached_sums)
aideqc_access_token = os.getenv('AIDEQC_ACCESS_TOKEN')

# update homebrew deploy 
run_command(os.getcwd()+'/homebrew-deploy', 'git', 'pull')

# pull xacc with submodules, create tar.gz, compute shasum
# compare with previous shasum...
# if different, pull homebrew-deploy, update xacc.rb
run_command(os.getcwd()+'/xacc', 'git', 'pull')
print('creating xacc tar.gz file')
run_command_silent(os.getcwd(), 'tar', '-czvf', 'xacc-1.0.0.tar.gz', 'xacc')

xacc_src_hash = compute_sha256sum('xacc-1.0.0.tar.gz')
print('current xacc source hash:', xacc_src_hash)
print('previous xacc source hash:', cached_sums['xacc']['source'])
homebrew_changes_occured = False
git_message = ''
if xacc_src_hash != cached_sums['xacc']['source']:
    print('not equal, updating homebrew-deploy and uploading new xacc source.')
    # need to update xacc.rb
    xacc_rb_file_lines = []
    with open('homebrew-deploy/Formula/xacc.rb', 'r') as fin:
        xacc_rb_file_lines = fin.readlines()

    new_xacc_rb_file_str = ''
    for line in xacc_rb_file_lines:
        if 'sha256' in line and '=>' not in line:
            new_xacc_rb_file_str += '  sha256 "'+xacc_src_hash+'"\n'
        else:
            new_xacc_rb_file_str += line
    print(new_xacc_rb_file_str)
    with open('homebrew-deploy/Formula/xacc.rb', 'w') as fout:
        fout.write(new_xacc_rb_file_str)
        homebrew_changes_occured = True
        git_message += 'automated bot updating xacc source hash: {} to {}.'.format(cached_sums['xacc']['source'], xacc_src_hash)
    
    cached_sums['xacc']['source'] = xacc_src_hash

    # and then push new xacc source tar with jfrog
    # run_command(os.getcwd(), 'jfrog', 'bt', 'u', '--override', '--publish', 'xacc-1.0.0.tar.gz', 'amccaskey/qci-homebrew-bintray/xacc-source/xacc-1.0.0')

run_command(os.getcwd(), 'wget', 'https://github.com/ornl-qci/qcor/tarball/master')
qcor_src_hash = compute_sha256sum('master')
print('current qcor source hash:', qcor_src_hash)
print('previous qcor source hash:', cached_sums['qcor']['source'])
git_message = ''
if qcor_src_hash != cached_sums['qcor']['source']:
    print('not equal, updating homebrew-deploy and uploading new qcor source.')
    # need to update xacc.rb
    qcor_rb_file_lines = []
    with open('homebrew-deploy/Formula/qcor.rb', 'r') as fin:
        qcor_rb_file_lines = fin.readlines()

    new_qcor_rb_file_str = ''
    for line in qcor_rb_file_lines:
        if 'sha256' in line and '=>' not in line:
            new_qcor_rb_file_str += '  sha256 "'+qcor_src_hash+'"\n'
        else:
            new_qcor_rb_file_str += line
    print(new_qcor_rb_file_str)
    with open('homebrew-deploy/Formula/qcor.rb', 'w') as fout:
        fout.write(new_qcor_rb_file_str)
        homebrew_changes_occured = True
        git_message += 'automated bot updating qcor source hash: {} to {}.'.format(cached_sums['qcor']['source'], xacc_src_hash)

    cached_sums['qcor']['source'] = qcor_src_hash

# Remove the qcor and xacc tar files
run_command(os.getcwd(), 'rm', '-rf', 'master')
run_command(os.getcwd(), 'rm', '-rf', 'xacc-1.0.0.tar.gz')

# pull xacc bottles and check their shasums, update homebrew if necessary
for _os in ['mojave', 'catalina', 'x86_64_linux']:
    base_url = 'https://dl.bintray.com/amccaskey/qci-homebrew-bintray/'
    file_name = 'xacc-1.0.0.{}.bottle.tar.gz'.format(_os)
    print('downloading xacc {}'.format(_os))
    wget.download(base_url+file_name)
    print()
    current_shasum = compute_sha256sum(file_name)
    if current_shasum != cached_sums['xacc'][_os]:
        print('xacc {} hash {} not equal to old one {}'.format(_os, current_shasum, cached_sums['xacc'][_os]))
        # need to update xacc.rb
        xacc_rb_file_lines = []
        with open('homebrew-deploy/Formula/xacc.rb', 'r') as fin:
            xacc_rb_file_lines = fin.readlines()

        new_xacc_rb_file_str = ''
        for line in xacc_rb_file_lines:
            if 'sha256' in line and '=> :{}'.format(_os) in line:
                new_xacc_rb_file_str += '    sha256 "'+current_shasum+'" => :{}\n'.format(_os)
            else:
                new_xacc_rb_file_str += line
        print(new_xacc_rb_file_str)
        with open('homebrew-deploy/Formula/xacc.rb', 'w') as fout:
            fout.write(new_xacc_rb_file_str)
            homebrew_changes_occured = True
            tmp = 'automated bot updating xacc {} bottle hash: {} to {}'.format(_os, cached_sums['xacc'][_os], current_shasum)
            git_message += tmp
            print(tmp)
        
        cached_sums['xacc'][_os] = current_shasum
    
    run_command(os.getcwd(), 'rm', '-rf', file_name)
   
    # Now do it for qcor
    print('downloading qcor {}'.format(_os))
    file_name = 'qcor-1.0.0.{}.bottle.tar.gz'.format(_os)
    wget.download(base_url+file_name)
    print()
    current_shasum = compute_sha256sum(file_name)
    if current_shasum != cached_sums['qcor'][_os]:
        print('qcor {} hash {} not equal to old one {}'.format(_os, current_shasum, cached_sums['qcor'][_os]))
        # need to update qcor.rb
        qcor_rb_file_lines = []
        with open('homebrew-deploy/Formula/qcor.rb', 'r') as fin:
            qcor_rb_file_lines = fin.readlines()

        new_qcor_rb_file_str = ''
        for line in qcor_rb_file_lines:
            if 'sha256' in line and '=> :{}'.format(_os) in line:
                new_qcor_rb_file_str += '    sha256 "'+current_shasum+'" => :{}\n'.format(_os)
            else:
                new_qcor_rb_file_str += line
        print(new_qcor_rb_file_str)
        with open('homebrew-deploy/Formula/qcor.rb', 'w') as fout:
            fout.write(new_qcor_rb_file_str)
            homebrew_changes_occured = True
            tmp = 'automated bot updating qcor {} bottle hash: {} to {}'.format(_os, cached_sums['qcor'][_os], current_shasum)
            git_message += tmp
            print(tmp)
            
        
        cached_sums['qcor'][_os] = current_shasum

    run_command(os.getcwd(), 'rm', '-rf', file_name)

with open(cache_file_name, 'w', encoding='utf-8') as f:
    print('writing new sums to file.')
    json.dump(cached_sums, f, ensure_ascii=False, indent=4)

if homebrew_changes_occured:
    print()
    print('home brew changes did occur, we will push changes')
    print(git_message)
    run_command(os.getcwd()+'/homebrew-deploy', 'git', 'add', 'Formula')
    run_command(os.getcwd()+'/homebrew-deploy', 'git', 'commit', '-m', '"{}"'.format(git_message))
    run_command(os.getcwd()+'/homebrew-deploy', 'git', 'push', 'aideqchbdeploy', 'HEAD:master')


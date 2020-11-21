#!/bin/bash

set -e

/bin/bash -c "$(curl -fsSL https://aide-qc.github.io/deploy/install.sh)"
printf "__qpu__ void f(qreg q) {\n  H(q[0]);\n  Measure(q[0]);\n}\nint main() {\n  auto q = qalloc(1);\n  f(q);\n  q.print();\n}" | qcor -v -qpu qpp -shots 1024 -x c++ - && ./a.out
printf "from qcor import qjit, qalloc, qreg\n@qjit\ndef bell(q : qreg):\n    H(q[0])\n    CX(q[0], q[1])\n    for i in range(q.size()):\n        Measure(q[i])\nq = qalloc(2)\nbell(q)\nprint('Results')\nprint(q.counts())" | tee test.py && PYTHONPATH=$(qcor -qcor-install):$(qcor -xacc-install) python3 test.py -qpu qpp -shots 1024

# clean up for next time
rm test.py a.out
brew uninstall xacc qcor
brew untap aide-qc/deploy
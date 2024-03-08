Welcome to the Ollamanator!
A bash script to automate making custom models in Ollama.
By: William Cornell
wtcornel@mtu.edu
This software is licensed under the GNU General Public License v3.0 License.

Requrements:
ollama (https://github.com/ollama/ollama)

1. Install Ollama:
# curl -fsSL https://ollama.com/install.sh | sh

2. Make The Script Executable:
chmod a+x ollamanator.sh

3. Run the Ollamanator:
./ollamanator.sh

Resources:

Using Ollama:
# ollama -h

Github:
https://github.com/ollama/ollama

Pre-Packaged models are available at:
https://ollama.com/library

Modelfile Template
https://github.com/b1ip/ollama_modelfile_template/blob/main/Modelfile

How it works: all this script does is write a modelfile according to the template at (https://github.com/ollama/ollama) and then:

# ollama create <ModelName> -f ./<ModelFile>




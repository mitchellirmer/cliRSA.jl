# Homebrew RSA application

Running this program requires a working installation of Julia.


------ https://julialang.org/downloads/

To start the program, open a terminal in the folder containing

------- 1. This program

------- 2. The file or files to be encrypted/decrypted

------- 3. A folder called "keys_me"

------- 4. A folder called "keys_X" where "X" is the name of the recipient

Start the Julia REPL by running "julia"

Start the program by running "include("cryptoV2.jl")" 

------- You may get an error about missing packages.  If so, install them from the built in package manager.

------- https://docs.julialang.org/en/v1/stdlib/Pkg/

Run keygen(size_of_e) where size_of_e > 1x10^6

To encrypt, run encrypt("file_to_encrypt", "keys_X")
 
To decrypt, run decrypt("file_to_decrypt", ".output_file_extension")

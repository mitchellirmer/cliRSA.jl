# Command Line RSA (cliRSA.jl)
 
This code was developed as project in Coding Theory, taught at the Naval Postgraduate School, Monterey, CA.  It is a series of command line functions in Julia to encrypt files with large (>500 bit) RSA, perhaps before uploading to cloud storage or transmitting via email.  It works on PDFs, PNGs, JPEGs, ODTs, and probably others.
 
## Instructions for use
 
### Add this package to Julia using Pkg.
 
> julia > ]  
>
> Pkg > add git@github.com:mitchellirmer/cliRSA.jl.git  
>
> Pkg > <backspace>  

 
### Create a storage tree in your file storage
The location of your keys and of the receipient's public key are arguments to the encrypt and decrypt functions.
 
You will need a folder to save your own private and public keys, and one folder for each of the public keys for anyone you want to send documents to.  The folder for your own keys must be called "keys_me".  Your method for storing receipient keys has more flexibility.  

### Generate your keys
In the directory where you would like to create folders for keys and handle file IO, run
 
> julia > using cliRSA  
>
> julia > keygen(size_e)
 
where size_e is the size of the encription exponent, usually a number like 10^7.
 
```@docs
keygen(size_e)
```
 
### Swap keys with friends
You can send public key files over email or other open channels.
 
### Run the program
 
```@docs
printhelp()
```
```@docs
encrypt(ptfile, to)
```
```@docs
decrypt(ctfile, ext)
```
 
```@contents
Pages = ["index.md", "functions.md"]
Depth = 3
```

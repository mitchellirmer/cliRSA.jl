export printhelp
"""
    printhelp()
    
Prints help in STDOUT
"""
function printhelp()
    print("\n\n")
    print("*************************************************************\n")
    print("************************ INSTRUCTIONS ***********************\n\n")
    print("** keygen(size_of_e) -- Share the public key with friends.\n")
    print("** encrypt(\"plaintext_file_name\", \"receipient_key_folder\")\n")
    print("** decrypt(\"ciphertext_file_name\", \"recovered_file_extension\")\n")
    print("***** example:  decrypt(\"ciphertext.txt\",\".odt\")\n\n")
    print("*************************************************************\n\n")
end

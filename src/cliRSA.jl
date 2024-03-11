module cliRSA

using Statistics, Random, StringEncodings, DelimitedFiles, Primes, FileIO

include("printhelp.jl")
include("keygen.jl")
include("keyloader.jl")
include("encoder.jl")
include("encrypt.jl")
include("decode2.jl")
include("decrypt.jl")

end

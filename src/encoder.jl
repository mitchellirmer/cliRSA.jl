export encoder

"""
    encoder(ptfile)

Encodes a file (jpg, pdf, odt, etc).

Called by the encrypt function.
"""
function encoder(ptfile)
    blocksize = 7;
    binarysize = 256;
    m2 = read(ptfile)
    totalsize = blocksize * ceil(length(m2)/blocksize);
    paddingsize = totalsize - length(m2);
    padding = zeros(UInt8,UInt8(paddingsize),1);
    m2 = [m2; padding]
    indices = 1:blocksize:length(m2)-blocksize+1
    m = [];
    for eachindex in indices
        block = 0;
        for index in 1:blocksize
            blocknew = m2[eachindex+index-1]*binarysize^(index-1)
            block = block + blocknew
        end
        push!(m,block)
    end
    return m 
end

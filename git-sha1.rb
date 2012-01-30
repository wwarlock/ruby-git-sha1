#!/usr/bin/env ruby
require 'digest/sha1'

def get_sha1_by_git_style(filename)
    mem_buf = File.open(filename,"rb") {|io| io.read}
    size = mem_buf.size
    puts "size is #{size}"

    header = "blob #{size}\0" # type(space)size(null byte)
    store = header + mem_buf

    sha1 = Digest::SHA1.hexdigest(store)
    return sha1
end

## Main()
ARGV.each do|a|
puts get_sha1_by_git_style(a)
end

#!/usr/bin/env ruby

# gets all folders
def self.get_folders
 Dir.entries('.').select {|entry| File.directory? File.join('.',entry ) and !(entry =='.' || entry == '..') }
end

# selects folders with plugins
def self.plugins
  get_folders.select {|entry| entry.match(/plugin/)}
end

# gets readme files in the folders
def self.get_readmes
	c = File.open("docs.md", "w")
	get_folders = plugins
	get_folders.each do |folder|
		Dir.glob('./' + folder + '/*.md') do |md|
			puts md
			puts %(md\n=============)
			f = File.open(md, "r") 
				f.each_line do |line|
					c.write line
				end
			end 
		end 
			puts '============='
end

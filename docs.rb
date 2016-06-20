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
	get_folders = plugins
	# readmes = []
	get_folders.each do |folder|
		Dir.glob('./' + folder + '/*.md') do |md|
			puts md
			puts %(md\n=============)
			File.open("docs.md", "w") do |filea| 
			File.open(md, "r") do |fileb|
				fileb.readlines.each do |line|
				filea.puts line
			# while line = fileb.gets	
			# 	filea.puts line 
			# end 
			end
		end
	end 
	end 
			puts '============='
end

end

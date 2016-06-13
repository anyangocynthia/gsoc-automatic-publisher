# class  docs

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
		puts './' + folder + '\n============='
		Dir.glob('./' + folder + '/*.md') do |md|
			puts md
			puts %(md\n=============)
			f = File.open(md, "r")
			f.each_line do |line|
				puts line
			end
			puts '============='
		end
	end
end
# end
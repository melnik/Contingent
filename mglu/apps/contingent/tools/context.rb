# ``Require'' this in almost any tool script written on Ruby.

Dir.chdir "#{(old_dir = Dir.pwd).gsub(/\/apps.*$/, '')}/apps/contingent"

$LOAD_PATH << 'share'

require '../../plugins/radical-core/extensions'
require 'extensions'

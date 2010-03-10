#require 'jruby_demo'

import 'javax.swing.JTextField'

import 'javax.swing.JTextArea'
import 'javax.swing.JButton'
import 'javax.swing.BoxLayout'

ta = JTextArea.new

f = JFrame.new

b = JButton.new 'get mood'

f.get_content_pane.set_layout(BoxLayout.new(f.get_content_pane, BoxLayout::Y_AXIS))

require 'rubygems'

require 'nokogiri'

f.visible= true

f.add b



f.add ta

ta.rows= 10

ta.columns= 50

f.pack

require 'open-uri'

doc = Nokogiri::XML.parse open("http://api.wefeelfine.org:8080/ShowFeelings?returnfields=feeling&display=xml&limit=10&conditions=1").read

b.add_action_listener do |event|
doc = Nokogiri::XML.parse open("http://api.wefeelfine.org:8080/ShowFeelings?returnfields=feeling&display=xml&limit=10&conditions=1").read
doc.search('feeling').each {|e| ta.append(e.attr('feeling')); ta.append("\n")}
end

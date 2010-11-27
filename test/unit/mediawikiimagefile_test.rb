require 'test_helper'

class MediawikiimagefileTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "testgeneric" do
    g = GenGeoTag.new()
    newpoint = {}
    newpoint["latitude"]=123
    newpoint["longitude"]=345
    g.create_point_geotag(Mediawikiimagefile,"mediawikiimagefile",1, newpoint)


  end

  # test "geturl" do
  #       f=Mediawikiimagefile.new
  #   f.geturl("http://www.archive.org/index.php","testfile")
  # end

  # test "def genfilename (idtoget,basename)" do 
  #   f=Mediawikiimagefile.new
  #   filename =f.genfilename("idtoget123","basename")
  #   f.geturl("http://www.archive.org/index.php",filename)
    
  # end

  # test "def getdata (url,idtoget)" do
  #   f=Mediawikiimagefile.new
  #   f.geturl("http://www.archive.org/index.php","1234")

  # end

  # test "def pull " do
  #   f=Mediawikiimagefile.new
  #   data = f.pull("File:Brandbil i Hofors.jpg")
  # end


end

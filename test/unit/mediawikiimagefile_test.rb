require 'test_helper'

class MediawikiimagefileTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  def makenew
    obj =Mediawikiimagefile.new()
    obj.save
    p "Made new object " 
    p obj
    return obj
  end

  test "testgeneric" do
    g = GenGeoTag.new()
    newpoint = {}
    newpoint["latitude"]=123
    newpoint["longitude"]=345
    obj = makenew()
    
    pnt = g.create_point_geotag(Mediawikiimagefile,obj.id, newpoint)
    p pnt
  end

  test "testgeneric2" do
    g = GenGeoTag.new()
    newpoint = {}
    obj = makenew()
    pnt= g.create_point_geotag(Mediawikiimagefile,obj.id, newpoint)
    p pnt
  end

  test "testgeneric3" do
    g = GenGeoTag.new()
    newpoint = {}
    newpoint["latitude"]=123
    newpoint["longitude"]=345
    obj = makenew()
    pnt= g.create_point_geotag(Mediawikiimagefile,obj.id, newpoint)
    p pnt

# now update the point
    newpoint["latitude"]=345
    newpoint["longitude"]=434

    pnt= g.create_point_geotag(Mediawikiimagefile,obj.id, newpoint)

    p pnt 

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



class RMAssets 

  def initialize
  end

  def lib_dir_path
    File.dirname(File.expand_path(__FILE__))
  end

  def unused
    print `sh /#{lib_dir_path}/../rm_asset_cleaner`
  end
end


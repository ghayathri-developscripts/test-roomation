module PackagesHelper

  def select_package_by_code code
    Package.find { |package| package.code.eql?(code) }
  end

  def package_summary package
    package.benefits.gsub(',', '<br />')
  end

end

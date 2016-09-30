require 'open3'
require 'bson'

def rungnuplot(params)
  cmd = 'gnuplot'
  inp = "#{params['input'].data}"
  out = ''
  err = ''

  Dir.chdir(Dir.home)

  params.keys.each do |k|
    if k.eql?('input')
      next
    end
    File.write(k, params[k].data)
  end

  begin
    Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
      stdin.write inp
      stdin.close
      out = stdout.read
      err = stderr.read
    end
  ensure
    params.keys.each do |k|
      if k.eql?('input')
        next
      end
      File.exists?(k) ? File.delete(k) : ''
    end
  end

  result = Hash.new
  result['output'] = BSON::Binary.new(out)
  return result
end

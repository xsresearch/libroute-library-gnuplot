require 'open3'
require 'bson'

def rungnuplot(params)
  cmd = 'gnuplot'
  inp = "set terminal #{params['term']}\nplot [#{params['limits']}] #{params['function']}\n"
  out = ''
  err = ''

  Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
    stdin.write inp
    stdin.close
    out = stdout.read
    err = stderr.read
  end

  result = Hash.new
  result['stdout'] = BSON::Binary.new(out)
  return result
end

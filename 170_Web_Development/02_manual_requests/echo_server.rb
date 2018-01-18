require 'socket'

server = TCPServer.new('localhost', 3003)

def parse_path(string)
  path, params_string = string.split('?')

  params = (params_string || "").split('&').each_with_object({}) do |pair, hash|
    key, value = pair.split('=')
    hash[key] = value
  end
  [path, params]
end

loop do
  client = server.accept
  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"

  http_method, path_and_params, html = request_line.split(' ')
  path, params = parse_path(path_and_params)

  client.puts "<!DOCTYPE html>"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"

  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = params['number'].to_i
  client.puts "<p>This counter has number #{number}.</p>"
  client.puts "<a href=?number=#{number + 1}>Add one</a>"
  client.puts "<a href=?number=#{number - 1}>Subtract one</a>"

  client.puts "</body>"
  client.puts "</html>"

  client.close
end

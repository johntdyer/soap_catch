%w(logger sinatra).each{|lib| require lib}


LOG_FILE='soap_messages.log'
$LOG = Logger.new(LOG_FILE, 'weekly')
$LOG.level = Logger::INFO  

post '/' do
  $LOG.info(request.env["rack.input"].read)
  $LOG.debug(params[:splat])
  content_type 'text/xml', :charset => 'utf-8'
  
'<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Body><ns:uploadUsageEventsResponse xmlns:ns="http://connectsm.ws.bwse.com/xsd"><ns:return>Success</ns:return></ns:uploadUsageEventsResponse></soapenv:Body></soapenv:Envelope>'
end

get '/' do
  $LOG.info(request.env["rack.input"].read)
  $LOG.debug(params[:splat])
  content_type 'text/xml', :charset => 'utf-8'
'<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Body><ns:uploadUsageEventsResponse xmlns:ns="http://connectsm.ws.bwse.com/xsd"><ns:return>Success</ns:return></ns:uploadUsageEventsResponse></soapenv:Body></soapenv:Envelope>'  

end
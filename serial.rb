require 'serialport'

def wread
  sp = SerialPort.new "/dev/tty.usbmodem1a121", 9600
  temp = ""
  while TRUE do
    sleep 1 / 9600 
     while (i = sp.gets) do
       sleep 1 / 9600
       if (i.ord === 10 )
         puts temp
         temp = ""
       else 
         temp += i
       end
    end
  end
end

def wsend
  sp = SerialPort.new "/dev/tty.usbmodem1a121", 9600
    while TRUE do
      out = gets
        out.each_char do |c|
        sp.putc c
      end
  end
end

t1=Thread.new{wread}
t2=Thread.new{wsend}
t1.join
t2.join

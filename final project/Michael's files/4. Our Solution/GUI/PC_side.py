import PySimpleGUI as sg
import time
import serial as ser


def init_uart():
    global s
    s = ser.Serial('COM6', baudrate=115200, bytesize=ser.EIGHTBITS,
                   parity=ser.PARITY_NONE, stopbits=ser.STOPBITS_ONE,
                   # write_timeout=1,
                   timeout=1)  # timeout of 1 sec so that the read and write operations are blocking,
    # after the timeout the program continues
    # clear buffers
    s.reset_input_buffer()
    s.reset_output_buffer()


def send_command(char):
    global s
    s.write(bytes(char, 'ascii'))
    time.sleep(0.05)  # delay for accurate read/write operations on both ends


def receive_data():
    chr = b''
    while chr[-1:] != b'\n':
        chr += s.read(1)
        if chr == b'':
            break

    return chr.decode('ascii')


def receive_char():
    data = b''
    time.sleep(0.25)  # delay for accurate read/write operations on both ends
    while len(data.decode('ascii')) == 0:
        data = s.read_until(terminator=b'\n')  # read  from the buffer until the terminator is received,
    return data.decode('ascii')


def GUI():
    sg.theme('BlueMono')

    layout_main = [
        [sg.Text("CPU Final Project - Michael and Roy", size=(35, 2), justification='center', font='Verdana 15')],
        [sg.Button("Count up onto LEDs", key='_CountUp_', size=(35, 2), font='Verdana 15')],
        [sg.Button("Count down onto LEDs", key='_CountDown_', size=(35, 2), font='Verdana 15')],
        [sg.Button("Clear LEDs", key='_ClearLEDs_', size=(35, 2), font='Verdana 15')],
        [sg.Button('On KEY1 pressed send "I love my Negev"', key='_SendMsg_', size=(35, 2), font='Verdana 15')],
        [sg.Text('')],
        [sg.Text("", key='_Output_', size=(50, 2), justification='center', font='Verdana 15')]
    ]

    window = sg.Window(title='MIPS based MCU Architecture', element_justification='c', layout=layout_main,
                       size=(700, 600))

    init_uart()
    while True:
        event, values = window.read()
        #       event, values = window.read(timeout=100)
        if event == sg.WIN_CLOSED:  # if user closes window or clicks cancel
            send_command('Q')  # quit
            break
        elif event == '_ClearLEDs_':
            send_command('1')
            window['_Output_'].update(f"Clear all LEDs")
        elif event == '_CountUp_':
            send_command('2')
            window['_Output_'].update(f"Count up from 0x00 onto LEDs with delay ~0.5sec")
        elif event == '_CountDown_':
            send_command('3')
            window['_Output_'].update(f"Count down from 0xFF onto LEDs with delay ~0.5sec")
        elif event == '_SendMsg_':
            send_command('4')
            window['_Output_'].update(f"On each KEY1 pressed, send the message “I love my Negev”")

          #  window['_Output_'].update(f" ")
         #   window['_Output_'].Widget.tag_configure("blue_text", foreground="blue")
         #   window['_Output_'].Widget.insert("end", "Press KEY1 to receive a lovely message \n", "blue_text")
            while True:
          #      window['_Output_'].Widget.tag_configure("red_text", foreground="red", font=('Segoe UI', 20))
           #     window['_Output_'].Widget.insert("end", receive_data(), "red_text")
                print(receive_data(), end='')
                event, values = window.read(timeout=500)
                window.refresh()
                if event != "__TIMEOUT__":
                    flag = 0
                    break

    window.close()


if __name__ == '__main__':
    # init_uart()
    # send_command('2')
    GUI()

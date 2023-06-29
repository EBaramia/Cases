import pywhatkit 

def send_massage_inst():
    mobile = '+79853859093'
    massage = 'hi'

    pywhatkit.sendwhatmsg_instantly(phone_no=mobile, massage=massage)

def main():
    send_massage_inst()

if __name__=='__main__':
    main()
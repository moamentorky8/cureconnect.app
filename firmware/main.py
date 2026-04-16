from machine import Pin, PWM, I2C
import time
import config

# 1. تعريف الأطراف (Pins)
# السيرفو على 14 عشان ميتعارضش مع الـ SD
servo = PWM(Pin(14), freq=50)
pir = Pin(27, Pin.IN)
buzzer = Pin(13, Pin.OUT)
sos_button = Pin(34, Pin.IN) # زرار البريسليت

def set_servo_angle(angle):
    duty = int(1638 + (angle / 180) * (8192 - 1638))
    servo.duty_u16(duty)

# 2. وظيفة صرف الدواء
def dispense():
    print("🚨 Motion Detected! Dispensing...")
    set_servo_angle(90)
    time.sleep(1)
    set_servo_angle(0)
    # تنبيه صوتي
    buzzer.value(1)
    time.sleep(0.5)
    buzzer.value(0)

# 3. وظيفة الـ SOS (البريسليت)
def check_sos():
    if sos_button.value() == 1:
        print("🆘 SOS Alert Sent to Mobile!")
        # هنا هنضيف كود إرسال الداتا للـ Firebase لاحقاً
        return True
    return False

# --- اللوب الأساسي ---
print("🚀 CureConnect System is LIVE")
set_servo_angle(0) # وضع الإغلاق

while True:
    if pir.value() == 1:
        dispense()
    
    if check_sos():
        # تنبيه محلي إن الـ SOS اتبعتت
        buzzer.value(1)
        time.sleep(0.1)
        buzzer.value(0)
        
    time.sleep(0.1)

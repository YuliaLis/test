import telebot

bot = telebot.TeleBot('1168617740:AAEVZ412gWBa0I7Np_FC0xQ9t5kSfmhKTfE')

user_data = {}

'''try:
    db = mysql.connector.connect(
      host="localhost",
      user="root",
      passwd="root",
      port="3307",
      database="youtube"
    )
except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with your user name or password")
    sys.exit()
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
    sys.exit()
  else:
    print(err)
    sys.exit()
cursor = db.cursor()'''

class User:
    def __init__(self, first_name):
        self.first_name = first_name
        self.last_name = ''

@bot.message_handler(commands=['start', 'help'])
def send_welcome(message):
        msg = bot.send_message(message.chat.id, "Введите имя")
        bot.register_next_step_handler(msg, process_firstname_step)

def process_firstname_step(message):
    try:
        user_id = message.from_user.id
        user_data[user_id] = User(message.text)

        msg = bot.send_message(message.chat.id, "Введите фамилию")
        bot.register_next_step_handler(msg, start_handler)
    except Exception as e:
        bot.reply_to(message, 'oooops')

def start_handler(message):
    chat_id = message.chat.id
    text = message.text
    msg = bot.send_message(chat_id, 'Привіт, скільки вам рочків?')
    bot.register_next_step_handler(msg, askAge)


def askAge(message):
    chat_id = message.chat.id
    text = message.text
    if text.isdigit():
        checkAge(message)
        get_text_messages(message)
    else:
        msg = bot.send_message(chat_id, 'Вік повинен бути числом.')
        bot.register_next_step_handler(msg, askAge)


def checkAge(message):
    chat_id = message.chat.id
    text = message.text
    if int(text) >= 18:
        bot.send_message(chat_id, 'Чудово!')
    else:
        bot.send_message(chat_id, 'Вам повинно бути більше 18 рочків')

def get_text_messages(message):
    chat_id = message.chat.id
    text = message.text
    if int(text) >= 18:
        keyboard = telebot.types.InlineKeyboardMarkup()
        key_volonteer = telebot.types.InlineKeyboardButton(text='Волонтер', callback_data='volonteer', url="https://forms.gle/TEykbjoMVVT96DAZ9")
        keyboard.add(key_volonteer)
        key_client = telebot.types.InlineKeyboardButton(text='Клієнт', callback_data='client')
        keyboard.add(key_client)
        bot.send_message(message.from_user.id, text='Обирай, хто ти:', reply_markup=keyboard)

    else:
        bot.send_message(message.from_user.id, "На жаль, тільки повнолітні можуть працевлаштовуватися та брати тварину з притулку.")

@bot.callback_query_handler(func=lambda call: True)
def client(message):
    keyboard = telebot.types.InlineKeyboardMarkup()
    key_findAnimal = telebot.types.InlineKeyboardButton(text='Я загубив(-ла) тваринку', callback_data='findAnimal')
    keyboard.add(key_findAnimal)
    key_takeAnimal = telebot.types.InlineKeyboardButton(text='Я хочу взяти собі тваринку', callback_data='takeAnimal')
    keyboard.add(key_takeAnimal)
    key_giveAnimal = telebot.types.InlineKeyboardButton(text='Я хочу віддати тваринку', callback_data='giveAnimal')
    keyboard.add(key_giveAnimal)

    bot.send_message(message.from_user.id, text='Чим можемо тобі допомогти?', reply_markup=keyboard)

def process_lastname_step(message):
    try:
        user_id = message.from_user.id
        user = user_data[user_id]
        user.last_name = message.text

        '''sql = "INSERT INTO users (first_name, last_name, user_id) \
                                  VALUES (%s, %s, %s)"
        val = (user.first_name, user.last_name, user_id)
        cursor.execute(sql, val)
        db.commit()'''

        bot.send_message(message.chat.id, "Вы успешно зарегистрированны!")
    except Exception as e:
        bot.reply_to(message, 'Ошибка, или вы уже зарегистрированны!')

# Enable saving next step handlers to file "./.handlers-saves/step.save".
# Delay=2 means that after any change in next step handlers (e.g. calling register_next_step_handler())
# saving will hapen after delay 2 seconds.
bot.enable_save_next_step_handlers(delay=2)

# Load next_step_handlers from save file (default "./.handlers-saves/step.save")
# WARNING It will work only if enable_save_next_step_handlers was called!
bot.load_next_step_handlers()

if __name__ == '__main__':
    bot.polling(none_stop=True)

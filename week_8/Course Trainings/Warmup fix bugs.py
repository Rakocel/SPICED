class Animal:

    def __init__(self, name, sound):
        self.name = name
        self.sound = sound

    def make_sound(self):
        print(f'{self.sound.upper()}!!')

croc = Animal('crocodile', 'snap!')
croc.make_sound()
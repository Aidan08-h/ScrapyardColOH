# This is Opening Screen, where the user picks a champion (either Shaun or Aidan)

from tkinter import *



class Champion:
    
    def __init__(self, name, attack, heal):
        self.name = name
        self.health = 100
        self.attack = attack
        self.heal = heal

    def attacked(Attacker,theAttacked):
        theAttacked.health -= Attacker.attack

    def healed(Healer):
        Healer.health += Healer.heal


Shaun = Champion("Shaun", 10, 15)
Aidan = Champion("Aidan", 20, 5)

class OpeningScreen:


    def __init__(self, master):
        
        name = input("Hello! Welcome to Scrapyard Showdown! Challenger! What is your name?")
        print("Hello, ", name, "!", "We have gathered here this weekend to test your skills in the halls of champions!")

        print("We have two champions for you to challenge: Shaun and Aidan!")

        champ = input("Pick your champion: ")

        if champ == "Shaun" or champ == "shaun":
            self.champion = Shaun
        elif champ == "Aidan" or champ == "aidan":
            self.champion = Aidan


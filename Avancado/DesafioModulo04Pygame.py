# coding: iso-8859-1 -*- 

import pygame 
from pygame.locals import * 
from sys import exit 

pygame.init() 
screen = pygame.display.set_mode((760, 640)) 
pygame.display.set_caption("Desafio-Módulo 4")

move_x = 360
move_y = 320
atua_x = move_x
atua_y = move_y

#pygame.draw.rect(screen, (0,0,0), [atua_x,atua_y,10,10])
#pygame.draw.rect(screen, (255,0,0), [move_x,move_y,10,10])

while True: 
    
    pygame.draw.rect(screen, (0,0,0), [atua_x,atua_y,10,10])
    pygame.draw.rect(screen, (255,0,0), [move_x,move_y,10,10])

    for event in pygame.event.get():
        if event.type == QUIT:
            pygame.quit()
            exit()
        
        if event.type == KEYDOWN:
            atua_x = move_x
            atua_y = move_y
            if event.key == K_LEFT:
                  move_x -= 10 
            elif event.key == K_RIGHT: 
                move_x += 10 
            elif event.key == K_UP: 
                move_y -= 10 
            elif event.key == K_DOWN: 
                move_y += 10             
            
        #screen.fill((255,0,255))
        
        #if event.type == KEYDOWN:
        #   if event.key == K_LEFT: 
        #     print("Para Esquerda")
        #   elif event.key == K_RIGHT: 
        #     print("Para Direita")
        #   elif event.key == K_UP: 
        #     print("Para Cima")
        #   elif event.key == K_DOWN: 
        #     print("Para Baixo")
           
        #x, y = pygame.mouse.get_pos()            
        #print(x,y)

    pygame.display.update() 

player1 = {}
player2 = {}
rect = {}

function check_score()
   if player1.score == 10 then
        player1.x = -200
        player1.y = -200
        player1.width = -200
   player1.height = -200
   player1.speed = -200
   line_x = -200
   line_y = -200
   player2.x = -200
   player2.y = -200
   player2.width = -200
   player2.height = -200
   player2.speed  = 800

   rect.x =-200
   rect.y = -200     
   elseif player2.score == 10 then
       love.graphics.print("YOU ARE LOW, scnd",320, 240)
         player1.x = -200
         line_x = -200
   line_y = -200
   player1.y = -200
   player1.width = -200
   player1.height = -200
   player1.speed = -200

   player2.x = -200
   player2.y = -200
   player2.width = -200
   player2.height = -200
   player2.speed  = -200

   rect.x =-200
   rect.y = -200     
   end
end
function give_score()
  if rect.x < 0 then
    player2.score = player2.score +1
    rect.x = math.random(60,600)
    rect.y = math.random(40,400)
    random_direction = math.random(0,1)
    if random_direction == 0 then
       rect.direction = false
    else 
       rect.direction = true
    end      
  end
  if rect.x > 640 then
    player1.score =  player1.score + 1
    rect.x = math.random(60,600)
    rect.y = math.random(40,400)
    random_direction = math.random(0,1)
    if random_direction == 0 then
       rect.direction = false
    else 
       rect.direction = true
    end      
  end  
end
function move_rect()
   if rect.direction == false then   
       rect.x =rect.x - math.random(1,12)
    
       if (rect.x == player1.x + player1.width)or(player1.x + player1.width > rect.x
                                          and player1.x >rect.x)then   
             if (rect.y> player1.y and rect.y < player1.y+ player1.height) then
                 if(rect.y > player1.y) then      
                 rect.direction =true
                     rect.y = rect.y + 2
                      if rect.y > 480 or rect.y < 480 then
                        rect.y = math.random(1,100)
                     end         
              elseif(rect.y < player1.y) then
                 rect.direction =true
                     rect.y = rect.y - 2
                      if rect.y > 480 or rect.y < 480 then
                        rect.y = math.random(1,100)
                     end      
              end          
             end 
        end
   end   
   if rect.direction then
      rect.x = rect.x + math.random(1,12)

      if (player2.x == rect.x + rect.width) or(player2.x < rect.x+ rect.width 
                                          and player2.x + player2.width >rect.x+ rect.width )then 
           if(rect.y > player2.y and rect.y < player2.y + player2.height) then
              if(rect.y > player2.y) then      
                 rect.direction =false
                     rect.y = rect.y + math.random(1,100) 
                     if rect.y > 480 or rect.y < 480 then
                         rect.y = math.random(1,100)
                     end        
              elseif(rect.y < player2.y) then
                 rect.direction =false
                     rect.y = rect.y - math.random(1,100)
                     if rect.y > 480 or rect.y < 480 then
                        rect.y = math.random(1,100)
                     end     
              end          
           end 
      end
   end  
  
 

    

end
function randomize_everything_that_can_be_randomized()
  player1.speed  = math.random(4,8)
  player2.speed = math.random(4,8)
end
function love.load()
   line_x = 325
   line_y = 0
   player1.x = 20
   player1.y = 20
   player1.width = 40
   player1.height = 80
   player1.score = 0
   player1.speed = 4

   player2.x = 580
   player2.y = 20
   player2.width = 40
   player2.height = 80
   player2.score = 0
   player2.speed  = 4

   rect.x = 300
   rect.y = 300
   rect.width = 20
   rect.height = 20
   rect.direction = false
end
function love.update()
   give_score()
   move_rect()
   randomize_everything_that_can_be_randomized()
   check_score()
   if love.keyboard.isDown('w') then
      player1.y =player1.y - player1.speed
   end
   if love.keyboard.isDown('s') then
      player1.y =player1.y + player1.speed
   end

   if love.keyboard.isDown('up') then
      player2.y =player2.y - player2.speed      
   end
   if love.keyboard.isDown('down') then
      player2.y =player2.y + player2.speed       
   end

end
function love.draw()
   love.graphics.rectangle('fill',line_x,line_y,10,480)
   love.graphics.rectangle('fill', player1.x, player1.y,player1.width, player1.height)
   love.graphics.rectangle('fill',player2.x,player2.y,player2.width,player2.height)
   love.graphics.print("SCORE:"..player1.score,200,10)
   love.graphics.print("SCORE:"..player2.score,400,10)
   love.graphics.rectangle('fill',rect.x,rect.y,rect.width,rect.height)
    if player1.score == 10 then
      love.graphics.print("YOU ARE SHMUCK, second",170, 240,0, 2, 2)
     elseif player2.score == 10 then
       love.graphics.print("YOU ARE SHMUCK, first",170, 240,0, 2, 2)  
    end  
end
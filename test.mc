Khali Function main {
    
    Adad secret_num rakho 7;
    Adad user_guess rakho 0;
    Adad attempts rakho 0;
    
    chaapdo<- "Guess the number between 1 and 10!";
    
    JabTak (user_guess barabar secret_num) barabar Galat {
        
        chaapdo<- "Enter your guess: ";
        likhlo-> user_guess; 
        
        attempts rakho attempts jama 1;

        Agar user_guess kamHai secret_num {
            chaapdo<- "Too low, try again!";
        } NahiToh {
            Agar user_guess barabar secret_num {
                chaapdo<- "You got it!";
            } NahiToh {
                chaapdo<- "Too high, try again!";
            }
        }
    }
    
    chaapdo<- "You guessed it in ";
    chaapdo<- attempts;
    chaapdo<- " attempts!";
    
    ReturnKar 0;
}

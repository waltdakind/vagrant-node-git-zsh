   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo '~~~ Apt-get update, upgrade and autoremove ~~~'
   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo -e ' \n '
  sudo apt-get update 
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y

   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo '~~~Git and Zsh ~~~'

         if [ -n "$(ls -A /usr/bin/git)" ]
      then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Git is already installed"

          git config --global core.autocrlf true
else
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Attempting to Install Git..."

          sudo apt-get install -y git
          # the line below helps avoid some errors caused 
          # by DOS style carriage returns
          # can be disabled in Mac/Linux hosts
          git config --global core.autocrlf true
fi
   echo -e ' \n '

         if [ -n "$(ls -A /usr/bin/zsh)" ]
      then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Zsh is already installed"
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
else
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Attempting to Install Zsh..."

          sudo apt-get install -y zsh
fi
   echo -e ' \n '

   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo '~~~ Installing Oh-My-Zsh and restoring ~/.zshrc (if present) ~~'

   if [ ! -n "$(ls -A /home/vagrant/.oh-my-zsh)" ] 
   	then
      echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
         echo "Attempting to Install Oh-My-Zsh..."

         su vagrant sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
   	else
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo "Oh-My-Zsh is already installed"

   	fi


        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
if [[ -a /home/vagrant/share/.zshrc ]] && [[ -a /home/vagrant/.zshrc ]]  
then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo ".zshrc file already in home directory -- not overwriting."
 

elif [[ -a /home/vagrant/share/.zshrc ]]
  then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo ".zshrc file is present, attempting to copy."

          cp /home/vagrant/share/.zshrc /home/vagrant/.zshrc
else
         echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
         echo "No .zshrc file was present."

fi
   echo -e ' \n '

      
         if [ -n "$(ls -A /usr/bin/nodejs)" ]
      then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Node is already installed"

else
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Attempting to Install Node..."

          curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
          sudo apt-get install -y nodejs
          sudo apt-get install -y build-essential
fi
   echo -e ' \n '

         if [[ ! -a /home/vagrant/node_modules ]]
      then
                  mkdir /home/vagrant/node_modules
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Creating node modules in home directory..."


else
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Node modules directory already present"

fi
          echo -e ' \n '

   case $SHELL in
*/zsh)
   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~' 
   echo 'Shell has successfully been (re?)set to Zsh.'
;;

*/bash)
  echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  echo ' Bash is current shell -- '
  echo ' running -- chsh -s $(which zsh)  '
  echo ' to switch to zsh '
  chsh -s $(which zsh)

   ;;

*)
  echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  echo 'Unabe to detect current shell -- '
  sudo chsh -s $(which zsh)
esac
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo -e ' \n '



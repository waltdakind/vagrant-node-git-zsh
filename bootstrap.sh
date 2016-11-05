   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo '~~~ Apt-get update, upgrade and autoremove ~~~'
   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo -e ' \n '
  sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile


  sudo apt-get update 1> /dev/null 2>&1
  sudo apt-get upgrade -y 1> /dev/null 2>&1
  sudo apt-get autoremove -y 1> /dev/null 2>&1

   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo '~~~Git and Zsh ~~~'

         if [[ -a  /usr/bin/git ]]
      then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Git is already installed"

else
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Installing Git..."

          sudo apt-get install -y git 1> /dev/null 2>&1
          # the line below helps avoid some errors caused 
          # by DOS style carriage returns
          # can be disabled in Mac/Linux hosts
          git config --global core.autocrlf true
fi
   echo -e ' \n '

         if [[ -a /usr/bin/zsh ]]
      then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Zsh is already installed"
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
else
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Installing Zsh..."

          sudo apt-get install -y zsh 1> /dev/null 2>&1
fi


   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo '~~~ Installing Oh-My-Zsh and restoring ~/.zshrc (if present) ~~'

   if [[ ! -a /home/vagrant/.oh-my-zsh ]]
   	then
      echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
         echo "Installing Oh-My-Zsh..."
         su vagrant sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" 1> /dev/null 2>&1
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


      
         if [[ -a /usr/bin/nodejs ]]
      then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Node is already installed"

else
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Installing Node..."

          curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - 1> /dev/null 2>&1
          sudo apt-get install -y nodejs 1> /dev/null 2>&1
          sudo apt-get install -y build-essential 1> /dev/null 2>&1
fi
         if [[ ! -a /home/vagrant/node_modules ]]
      then
                  mkdir /home/vagrant/node_modules
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Creating node modules in home directory..."


else
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Node modules directory already present"

fi

    #Install Heroku toolbelt
 # config.vm.provision :shell, inline: "wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh"
   if [[ ! -a /usr/bin/heroku ]]
    then
      echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
         echo "Installing Heroku Toolbelt..."
         su vagrant sh -c "$(wget -O- https://toolbelt.heroku.com/install-ubuntu.sh)" 1> /dev/null 2>&1
    else
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo "Heroku Toolbelt is already installed"
    fi

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



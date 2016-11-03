  #  echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  #  echo '~~~ Apt-get update, upgrade and autoremove ~~~'
  #  echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
  #  echo -e ' \n '
  #  echo -e ' \n '
  # sudo apt-get update 
  # sudo apt-get upgrade -y
  # sudo apt-get autoremove -y
   echo -e ' \n '
   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo '~~~Git and Zsh ~~~'
   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
         if [ -n "$(ls -A /usr/bin/git)" ]
      then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Git is already installed"
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
else
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Attempting to Install Git..."
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          sudo apt-get install -y git
          # the line below helps avoid some errors caused 
          # by DOS style carriage returns
          # can be disabled in Mac/Linux hosts
          git config --global core.autocrlf true
         # change the lines below and uncomment to set up for your name and email address
         # git config --global user.name = "Walter Mattingly"
         # git config --global user.email = "waltdakind@gmail.com"
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
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          sudo apt-get install -y zsh
fi
   echo -e ' \n '

   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   echo '~~~ Installing Oh-My-Zsh and restoring ~/.zshrc (if present) ~~~'
   echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
   if [ ! -n "$(ls -A /home/vagrant/.oh-my-zsh)" ] 
   	then
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo "Attempting to Install Oh-My-Zsh..."
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
   	else
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        echo "Oh-My-Zsh is already installed"
        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
        sudo chsh -s $(which zsh)
   	fi
       echo -e ' \n '

        echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
if [[ -a /home/vagrant/share/.zshrc ]] && [[ -a /home/vagrant/.zshrc ]]  
then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo ".zshrc file already in home directory -- not overwriting."
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~' 

elif [[ -a /home/vagrant/share/.zshrc ]]
  then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo ".zshrc file is present, attempting to copy."
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          cp /home/vagrant/share/.zshrc /home/vagrant/.zshrc
else
         echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
         echo "No .zshrc file was present."
         echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
fi
   echo -e ' \n '

      
         if [ -n "$(ls -A /usr/bin/nodejs)" ]
      then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Node is already installed"
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
else
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Attempting to Install Node..."
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
          sudo apt-get install -y nodejs
          sudo apt-get install -y build-essential
fi
   echo -e ' \n '

         if [ ! -n "$(ls -A /home/vagrant/node_modules)" ]
      then
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Node modules already present"
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo -e ' \n '
else
          mkdir /home/vagrant/node_modules
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo "Creating node modules in home directory..."
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
          echo -e ' \n '
fi


   case $SHELL in
*/zsh) 
   echo 'Shell has successfully been (re?)set to Zsh.'
;;

*/bash)
  echo ' Bash is current shell -- '
  echo ' running -- chsh -s $(which zsh)  '
  echo ' to switch to zsh '
   chsh -s $(which zsh)

   ;;

*)
  echo 'Unabe to detect current shell -- '
esac
          echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
set -e

# Add build tools
apt-get update
apt-get install -y g++ libgd2-dev sudo

# Install component tools
gem install libroute-component

# Enable sudo
echo "user    ALL=(root) NOPASSWD: ALL" >> /etc/sudoers

# Switch user
su user

# Build gnuplot
cd /home/user
git clone https://github.com/gnuplot/gnuplot.git
cd gnuplot
git checkout remotes/origin/branch-5-0-stable
./prepare
./configure
make
sudo make install

# Remove build files
rm -r -f /home/user/gnuplot


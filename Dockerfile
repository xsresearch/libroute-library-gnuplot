FROM ruby:2.3.1

# Add user
RUN useradd -m -u 1000 user

# Add library build script and run
COPY build.sh /home/user/build.sh
RUN /home/user/build.sh

# Add libroute component files
COPY autoexec.rb /home/user/autoexec.rb
COPY rungnuplot.rb /home/user/rungnuplot.rb
RUN chown user:user /home/user/autoexec.rb /home/user/rungnuplot.rb

# Set user and entrypoint
USER user
ENTRYPOINT /home/user/autoexec.rb


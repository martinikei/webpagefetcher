# Use the official Ruby image as the base image
FROM ruby:2.7.7

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock /app/

RUN gem install bundler:2.4.12
# Install gems
RUN bundle

# Copy the application code to the container
COPY . /app/

# Expose port 3000 to the outside world
EXPOSE 3000

# Set the default command to an interactive shell
CMD ["/bin/bash"]

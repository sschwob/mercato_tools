# Start from the official Ruby image
FROM ruby:3.1.2

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Install Node.js and Yarn (needed for Rails asset compilation)
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Set the working directory
WORKDIR /mercato_tools

# Add the Gemfile and Gemfile.lock to the image
COPY Gemfile /mercato_tools/Gemfile
COPY Gemfile.lock /mercato_tools/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application into the image
COPY . /mercato_tools

# Expose the port that the Rails server will run on
EXPOSE 3000

# Define the command to start the server
CMD ["rails", "server", "-b", "0.0.0.0"]
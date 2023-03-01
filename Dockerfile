FROM ruby:3.0
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN mkdir /root/.kube
COPY ./.kube_example /root/.kube/config
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN chmod 777 ./example.rb
RUN mv ./kubectl /usr/local/bin
RUN ./kubectl apply -f ./crd_example.yaml
RUN ./kubectl apply -f ./custom_resource_example.yaml
CMD ["ruby", "example.rb"]
function fun() {
  var env = karate.env; karate.log('karate.env system property was:', env);
    return {
      baseUrl: karate.properties['karate.url'] || 'https://reqres.in/api/'
    }
  }

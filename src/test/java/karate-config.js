function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'stating';
  }
  var config = {
    env: env,
	
		
  }
   
  return config;
}



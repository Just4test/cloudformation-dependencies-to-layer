exports.handler = (event, context, callback) => {
  try{
    require('is-number')
    callback(null, 'OK!');
  }catch(err){
    callback(err)
  }
  
};
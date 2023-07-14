public class MapUsage {
	
    public static void mapUse()
    {
        Map<String,String> cityConMap= new Map<String,String>{
            'San Fransisco' => 'USA','Pune' => 'India'
        };
        cityConMap.put('Bangalore', 'India');
        cityConMap.put('NewYork', 'USA');
        cityConMap.put('Bangalore', 'Ind');//Replpacing existing value with the new value
        
        cityConMap.remove('NewYork');
        
        system.debug('CityconMap'+cityConMap+' with size :'+cityConMap.size());
        
        system.debug('CityconMap Keys :'+cityConMap.keySet());
        system.debug('CityconMap Values :'+cityConMap.values());
        system.debug('CityconMap contains a key ?'+cityConMap.containsKey('Newjersy')); 
        
        if(cityConMap.containsKey('Bangalore'))
        {
            system.debug('cityConMap value based on the key :'+cityConMap.get('Bangalore'));
        }
        
        //[Select Id, Name, AccountId form Contact] --> Map<Id,List<Contact>>
       
        
    }
}
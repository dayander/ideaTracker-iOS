import Foundation

// Runs query data task, and stores results in array of Tracks
class QueryService {
    
    typealias JSONDictionary = [String: Any]
    typealias QueryResult = ([Idea]?, String) -> ()
    
    var ideas: [Idea] = []
    var errorMessage = ""
    
    let defaultSession = URLSession(configuration: .default)
    // 2
    var dataTask: URLSessionDataTask?
    
    
    //added from web
    
    func getSearchResults(completion: @escaping QueryResult) {
        // 1
        dataTask?.cancel()
        // 2
        if var urlComponents = URLComponents(string: "https://idea-tracker-server.herokuapp.com/ideas") {
            //urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
            // 3
            guard let url = urlComponents.url else { return }
            // 4
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                // 5
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    print(data)
                    //print(response)
                    self.updateSearchResults(data)
                    // 6
                    DispatchQueue.main.async {
                        completion(self.ideas, self.errorMessage)
                    }
                }
            }
            // 7
            dataTask?.resume()
        }
    }
    
      func getSearchResults(searchTerm: String, completion: @escaping QueryResult) {
        // TODO
        DispatchQueue.main.async {
          completion(self.ideas, self.errorMessage)
        }
      }
    
    fileprivate func updateSearchResults(_ data: Data) {
        
        let jsonWithArrayRoot = try? JSONSerialization.jsonObject(with: data, options: [])
       // var response: NSMutableArray?
        ideas.removeAll()
        
        //  print("json", jsonWithArrayRoot as Any)
        
        for obj in (jsonWithArrayRoot as? [JSONDictionary])!{
            let id = obj["_id"] as! String
            let quickTitle = obj["quickTitle"] as! String
            let description = obj["description"] as! String
            let ideaUrl = obj["ideaURL"] as! String
            let priority = obj["priority"] as! String
            
            let newIdea = Idea(id: id,  quickTitle: quickTitle, description: description, ideaURL: ideaUrl, priority: priority)
            ideas.append(newIdea)
            
        }
        
        
    
    }
    
}

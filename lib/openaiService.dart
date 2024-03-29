import 'dart:convert';
import 'package:http/http.dart' as http;

//gpt-3.5-turbo
// https://api.openai.com/v1/chat/completions
// openassistant-llama2-70b
//https://api.llama-api.com/chat/completions

class openaiService{
  final List<Map<String ,String>> messages=[];

  Future <String> chatGPTAPI(String prompt) async {
    messages.add({'role': 'user','content': prompt});
     try{
      final res =await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: {"Content-Type" : " application/json",
        "Authorization": "Bearer $aikey"},
        body:jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages}));
        print(res.body);
        if (res.statusCode==200){
          String content = jsonDecode(res.body)['choices'][0]['message']['content'];
          content = content.trim();
          messages.add({'role':'assistant','content':content});
          return content;
        }
        return "chatgpt";
    }catch(e){
      return e.toString();
    }

  }
 
 //isse aage wala use m nhi le rhe ..image k liye code h but chkl nhi rhas

  Future <String> isArtPromptAPI(String prompt) async {
    try{
      final res =await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: {"Content-Type" : " application/json",
        "Authorization": "Bearer $aikey"},
        body:jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user","content": "Does this messsage want to genearte or show or ask  AI picture,image,art or anything similar? $prompt simply answer with a yes or no."}]
        }));
        print(res.body);
        if (res.statusCode==200){
          String content = jsonDecode(res.body)['choices'][0]['message']['content'];
          content = content.trim();
          switch(content){
            case 'yes':
             final res =await dallEAPI(prompt);
             return res;
            case 'YES':
             final res =await dallEAPI(prompt);
             return res;
            case 'Yes':
              final res =await dallEAPI(prompt);
             return res;
            case 'yes.':
             final res =await dallEAPI(prompt);
             return res;
            case 'Yes.':
             final res =await dallEAPI(prompt);
             return res;
            default:
             final res =await chatGPTAPI(prompt);
             return res;

          }
        }
        return "an internal error occured";
    }catch(e){
      return e.toString();
    }
  }

  Future <String> dallEAPI(String prompt) async {
     messages.add({'role': 'user','content': prompt});
     try{
      final res =await http.post(
        Uri.parse("https://api.openai.com/v1/images/generations"),
        headers: {"Content-Type" : " application/json",
        "Authorization": "Bearer $aikey"},
        body:jsonEncode({
          "model": "dall-e-3",
          "prompt":prompt,
          'n': 1}));
        print(res.body);
        if (res.statusCode==200){
          String imageurl = jsonDecode(res.body)['data'][0]['url'];
          imageurl = imageurl.trim();
          messages.add({'role':'assistant','content':imageurl});
          return imageurl;
        }
        return '';
    }catch(e){
      return e.toString();
    }
  }
}
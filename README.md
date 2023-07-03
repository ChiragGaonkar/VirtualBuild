# VirtualBuild

# Cross-Platform App for Architect Using Augmented Reality

Architecture has been present in our system for a long time. Since the stone age, there have only been improvements in the form of architecture we design. But, in today’s generation where technology plays an important role, there is a mix of technology in every application. From our daily activities to our work directly or indirectly we ought to deal with technology. With this, Augmented Reality is one of the fastest growing fields in today’s technocrat world, it is also presumed to be a key technology in almost all industries. This is where our project comes into the limelight. This project of ours discusses augmented reality and the way it can be implemented to make an Architectural design application. We have proposed an AR approach to Architectural design to improve the outcome between the architect and their client. Its always been an issue for the architect to explain their design through just prototypes and 3D models to their clients. But our project mitigates and overcomes this barrier by providing a proper augmented view to the client. Through this, the architect would be in a better position to showcase the design with proper attributes. To implement this various computer vision concepts are used to provide an interactive and immersive experience to the user.

void sendPushMessage(String body, String title, String token) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer AAAAl70s-q8:APA91bHrL41JVWp29eAIaZj40-G7xBfL8cHUoD2L77saUu6ZMLiTNpW1g0Tp8dGIKAFFEjq2yFpq3MTXX0jcQbrGDhmi7ys4XbkTDyBLsEh3c4a7MFDnWrhLDU1CEnQT_Tx2vCyMLGOs',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title,
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": token,
          },
        ),
      );
      print('done');
    } catch (e) {
      print("error push notification");
    }
  }

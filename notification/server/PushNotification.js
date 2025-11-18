const admin = require('firebase-admin');



// Carga del archivo de credenciales del service account

const serviceAccount = require('./serviceAccountKey.json');



// Inicializar el SDK de Firebase Admin

admin.initializeApp({

  credential: admin.credential.cert(serviceAccount),

});



// TODO: pega aquí el token FCM que te dio la app Flutter

const deviceToken = 'f9Xfut06RGWzuk2eujrn97:APA91bFQ9st_6ofebNUxlxTX25dBg0z9rBUGIk6u0pblZNx-g_qUde7z0uIUA7How6HrIdn40ZbiM0AzwQ6K-4gCExEd-rIFWcRbyPKyNjNr37ctuKPx3fc';



async function sendPush() {

  const message = {

    token: deviceToken,

    notification: {

      title: 'Hola desde Firebase Admin',

      body: 'Este es un mensaje enviado con la API v',

    },

    data: {

      origen: 'node-demo',

      tipo: 'prueba',

    },

  };



  try {

    const response = await admin.messaging().send(message);

    console.log('✅ Mensaje enviado correctamente:', response);

  } catch (error) {

    console.error('❌ Error al enviar mensaje:', error);

  }

}



sendPush();


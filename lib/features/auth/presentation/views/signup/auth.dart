import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthController {
  final _auth = FirebaseAuth.instance;
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseStorage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  // Registro de usuario con correo y contraseña
  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
            debugPrint("Something went good");
      return result.user;
    } catch (error) {
      debugPrint("Something went wrong");
      debugPrint("error_message:" +error.toString());

      return null;
      // Aquí simplemente lanzamos el error para manejarlo más adelante con getErrorMessage
    }
  }

  // Iniciar sesión con correo y contraseña
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      log("user not null");

      return result.user;
    } catch (error) {
      log("Something went wrong");
      return null;
      // Aquí simplemente lanzamos el error para manejarlo más adelante con getErrorMessage
    }
  }

  // Cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Obtener el usuario actual
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Enviar correo de verificación
  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  // Reenviar correo de verificación
  Future<void> resendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  // Comprobar si el correo del usuario ha sido verificado
  Future<bool> isEmailVerified() async {
    try {
      User? user = _auth.currentUser;
      await user?.reload();
      user = _auth.currentUser;
      return user?.emailVerified ?? false;
    } catch (error) {
      print('Error verificando el correo: $error');
      return false;
    }
  }

  // Enviar correo para reiniciar contraseña
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (error) {
      print('Error al enviar correo de reinicio: $error');
      throw error;
    }
  }

  // Método para obtener mensaje de error amigable
  String getErrorMessage(Exception error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return 'Lo sentimos, este usuario no existe';
        case 'wrong-password':
          return 'Contraseña incorrecta';
        case 'email-already-in-use':
          return 'Este correo ya está registrado';
        default:
          return 'Ocurrió un error desconocido. Por favor, intenta de nuevo.';
      }
    } else {
      // Para cualquier otro error no específicamente manejado
      return 'Ocurrió un error inesperado. Por favor, intenta de nuevo.';
    }
  }

  Future<String> uploadProfilePicture(String uid, File image) async {
    final ref = _firebaseStorage.ref().child('profile_pictures/$uid');
    final uploadTask = await ref.putFile(image);
    return await uploadTask.ref.getDownloadURL();
  }

  Future<void> saveClientDetailsToFirestore(
      String corp, String uid, String name,String password, String phoneNumber, String imageUrl,String nickName, String uid2,String entity_individual,String business,String tax,String address,String city_state_zip,String nit_social,) async {
    await _firestore.collection('users').doc(uid).set({
      'nombre': name,
      'uid': uid2,
      'phone' : phoneNumber,
      'password' : password,
      'correo': _firebaseAuth.currentUser?.email,
      'url_foto_perfil': imageUrl,
      'nickName' : nickName,
      'role': corp,
      'entity_individual' : entity_individual,
      'business' : business,
      'tax' : tax,
      'address' : address,
      'city_state_zip' : city_state_zip,
      'nit_social' : nit_social,
   

    });

    debugPrint("data_saved!");
  }

    Future<void> saveClientDetailsToFirestore2(
      String uid, String name, String last_name, String password, String phoneNumber, String email, String imageUrl,String nickName) async {
    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'last_name': last_name,
      'uid': uid,
      'email':email,
      'phone' : phoneNumber,
      'password' : password,
      'url_foto_perfil': imageUrl,
      'nickName' : nickName,
    });

    debugPrint("data_saved!");
  }

  
  Future<void> updateClientDetailsToFirestore(
      String uid, String imageUrl,String nickName, String description, String feeling, String url) async {
    await _firestore.collection('users').doc(uid).update({

    //  'url_foto_perfil': imageUrl,
      'nickName' : nickName,
      'description' : description,
      'feeling' : feeling,
      'url_foto_perfil' : url

    });

    debugPrint("data_saved!");
  }
}

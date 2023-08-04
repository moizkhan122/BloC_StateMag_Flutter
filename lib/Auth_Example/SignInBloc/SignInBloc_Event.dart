
  abstract class SignInEvent {
    
  }

  class SignInChangedValueEvent extends SignInEvent {
    final String emailValue;
    final String passValue;

    SignInChangedValueEvent(this.emailValue, this.passValue); 
  }

  class SignInSubmitValueEvent extends SignInEvent {
    final String submitEmail;
    final String submitPass;

    SignInSubmitValueEvent(this.submitEmail, this.submitPass); 
  }

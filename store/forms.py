from allauth.account.forms import SignupForm
from crispy_forms.helper import FormHelper
from crispy_forms.layout import *
from crispy_forms.bootstrap import *
from django.urls import reverse
from django import forms
from .models import Customer
class CustomSignupForm(SignupForm):

	def __init__(self, *args, **kwargs):
		super(CustomSignupForm, self).__init__(*args, **kwargs)
		customer = Customer.objects.none()
		# self.fields['first_name'] = forms.CharField(required=True)
		# self.fields['last_name'] = forms.CharField(required=True)
		# custom layout by crispy-form
		# already_txt = ("Already have an account? Then please <a href=\"%s\">"
		#                "sign in</a>")
		self.helper = FormHelper()
		self.helper.form_id = 'signup_form'
		self.helper.layout = Layout(
			'username',
			'email',
			# 'first_name',
			# 'last_name',
			'password1',
			'password2',
			ButtonHolder(
				
				Submit(
					'submit', 'register',
				),
				css_class='form-group'
			)
		)
	def save(self, *args, **kwargs):
		return super().save(*args, **kwargs)
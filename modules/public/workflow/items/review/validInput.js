$(document).ready(function() {
	FormValidation.Validator.mydiff = {
		validate: function(validator, $field, options) {
			var name = 'bookFascicleBookName';
			var $els = $('div[data-area="fascicle"]').find('input[name="' + name + '"]');
			var value = $field.val();

			if(!value) {
				return false;
			}

			var result = true;
			$els.each(function() {
				if(this !== $field[0] && $(this).val()) {
					if($(this).val() && $(this).val() === value) {
						result = false;
						return false;
					}
				}
			});
			return result;
		}
	};

});
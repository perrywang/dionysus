(function ($) {
  // Define a toolbar button. It will be available in the buttons option.
  $.Editable.commands = $.extend($.Editable.commands, {
    audioFile: {
      title: 'Audio Upload',
      icon: 'fa fa-magic',
      callback: function () {
        // Do something when the button is hit.
      }
    }
  });

  // Add an option for your plugin.
  $.Editable.DEFAULTS = $.extend($.Editable.DEFAULTS, {
    allowedAudioTypes: ['*']
  });

  $.Editable.prototype.audioFileUploadInit = function () {
    // The start point for your plugin.

    console.log (this.options.allowedAudioTypes)

  }

  // Register your plugin.
  $.Editable.initializers.push($.Editable.prototype.audioFileUploadInit);
})(jQuery);
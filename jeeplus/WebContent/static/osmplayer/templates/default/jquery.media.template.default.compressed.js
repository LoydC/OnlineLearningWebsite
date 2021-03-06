/**
 *  Copyright (c) 2010 Alethia Inc,
 *  http://www.alethia-inc.com
 *  Developed by Travis Tidwell | travist at alethia-inc.com 
 *
 *  License:  GPL version 3.
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.

 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */
(function(a) {
	jQuery.media = jQuery.media ? jQuery.media : {};
	jQuery.media.defaults = jQuery.extend(jQuery.media.defaults, {
		prefix : "",
		controllerOnly : false,
		playlistOnly : false
	});
	jQuery.media.templates = jQuery.extend({}, {
		"default" : function(b, c) {
			return new (function(d, e) {
				e = jQuery.media.utils.getSettings(e);
				var f = this;
				this.player = null;
				this.titleLinks = null;
				this.nodeWidth = 0;
				this.nodeHeight = 0;
				this.dialogWidth = 0;
				this.dialogHeight = 0;
				this.controlHeight = 0;
				this.showController = true;
				this.isFireFox = (typeof document.body.style.MozBoxShadow === "string");
				this.initialize = function(g) {
					this.nodeWidth = d.display.width();
					this.nodeHeight = d.display.height();
					this.dialogWidth = d.dialog.width();
					this.dialogHeight = d.dialog.height();
					this.controlHeight = d.controller ? d.controller.display.height() : 0;
					this.player = d.node ? d.node.player : null;
					this.titleLinks = d.titleBar ? d.titleBar.titleLinks : null;this.setPlaylistHeight();
				};
				this.setPlaylistHeight = function() {
					if (e.vertical && d.playlist && d.playlist.scrollRegion) {
						var h = d.playlist.display.height();
						if (h) {
							var g = d.playlist.pager ? d.playlist.pager.display.height() : 0;
							d.playlist.scrollRegion.display.height(h - g);
						}
					}
				};
				this.onResize = function() {
					this.setPlaylistHeight();
				};
				this.onMenu = function(g) {
					if (d.menu) {
						if (g) {
							d.menu.display.show("normal");
						} else {
							d.menu.display.hide("normal");
						}
					}
				};
				this.onMaximize = function(h) {
					var g = d.display.position();
					g = e.vertical ? g.left : g.top;
					var i = e.vertical ? h ? {
						width : (this.dialogWidth - g) + "px"
					} : {
						width : this.nodeWidth + "px"
					} : h ? {
						height : (this.dialogHeight - g) + "px"
					} : {
						height : this.nodeHeight + "px"
					};
					d.display.animate(i, 250, "linear", function() {
						d.onResize();
					});
				};
				this.setFullScreenPos = function() {
					var i = this.player.media.display.offset();
					var h = parseInt(this.player.media.display.css("marginLeft"), 10);
					var g = parseInt(this.player.media.display.css("marginTop"), 10);
					this.player.media.display.css({
						marginLeft : (a(document).scrollLeft() - i.left + h) + "px",
						marginTop : (a(document).scrollTop() - i.top + g) + "px",
						width : a(window).width(),
						height : a(window).height()
					});
				};
				this.onFullScreen = function(h) {
					if (h) {
						if (this.player) {
							a(window).bind("mousemove", function() {
								if (!f.player.hasControls() && f.showController) {
									jQuery.media.utils.showThenHide(d.controller.display, "display", "fast", "slow");
								}
								jQuery.media.utils.showThenHide(f.titleLinks, "links", "fast", "slow");
							});
							if (!this.player.hasControls() && this.showController) {
								jQuery.media.utils.showThenHide(d.controller.display, "display", "fast", "slow");jQuery.media.utils.stopHideOnOver(d.controller.display, "display");
							}
							jQuery.media.utils.showThenHide(this.titleLinks, "links", "fast", "slow");jQuery.media.utils.stopHideOnOver(this.titleLinks, "links");
						}
						d.dialog.addClass(e.prefix + "mediafullscreen");d.dialog.find("#" + e.prefix + "mediamaxbutton").hide();d.showNativeControls(true);
						if (this.player && this.player.media) {
							if (this.isFireFox) {
								this.setFullScreenPos();
								var g = 0;
								a(window).bind("scroll", function() {
									clearTimeout(g);
									g = setTimeout(function() {
										f.setFullScreenPos();
									}, 100);
								});
								var i = 0;
								a(window).bind("resize", function() {
									clearTimeout(i);
									i = setTimeout(function() {
										f.setFullScreenPos();
									}, 100);
								});
							} else {
								this.player.media.display.css({
									position : "fixed",
									overflow : "hidden"
								});
							}
						}
					} else {
						a(window).unbind("mousemove");jQuery.media.utils.stopHide(d.controller.display, "display");jQuery.media.utils.stopHide(this.titleLinks, "links");
						if (this.showController) {
							d.controller.display.show();
						}
						if (this.titleLinks) {
							this.titleLinks.show();
						}
						d.dialog.find("#" + e.prefix + "mediamaxbutton").show();d.dialog.removeClass(e.prefix + "mediafullscreen");d.showNativeControls(false);
						if (this.player && this.player.media) {
							if (this.isFireFox) {
								a(window).unbind("scroll");a(window).unbind("resize");this.player.media.display.css({
									marginLeft : "0px",
									marginTop : "0px",
									width : "100%",
									height : "100%"
								});
							} else {
								this.player.media.display.css({
									position : "absolute",
									overflow : "inherit"
								});
							}
						}
					}
					d.onResize();
				};
				this.onMenuSelect = function(i, h, g) {
					if (g) {
						h.show("normal");i.addClass(e.prefix + "ui-tabs-selected " + e.prefix + "ui-state-active");
					} else {
						h.hide("normal");i.removeClass(e.prefix + "ui-tabs-selected " + e.prefix + "ui-state-active");
					}
				};
				this.onLinkOver = function(g) {
					g.addClass(e.prefix + "ui-state-hover");
				};
				this.onLinkOut = function(g) {
					g.removeClass(e.prefix + "ui-state-hover");
				};
				this.onLinkSelect = function(h, g) {
					if (g) {
						a(h.display).addClass(e.prefix + "active");
					} else {
						a(h.display).removeClass(e.prefix + "active");
					}
				};
				this.onTeaserOver = function(g) {
					a(g.node.display).addClass(e.prefix + "ui-state-hover");
				};
				this.onTeaserOut = function(g) {
					a(g.node.display).removeClass(e.prefix + "ui-state-hover");
				};
				this.onTeaserSelect = function(g, h) {
					if (h) {
						a(g.node.display).addClass(e.prefix + "ui-state-hover");
					} else {
						a(g.node.display).removeClass(e.prefix + "ui-state-hover");
					}
				};
				this.onTeaserActivate = function(g, h) {
					if (h) {
						a(g.node.display).addClass(e.prefix + "ui-state-active");
					} else {
						a(g.node.display).removeClass(e.prefix + "ui-state-active");
					}
				};
				this.onMediaUpdate = function(g) {
					if (d.fullScreen && g.type == "playerready") {
						d.showNativeControls(true);
					}
					if (d.controller && d.node) {
						if (g.type == "reset") {
							this.showController = true;d.controller.display.show();d.node.display.css("bottom", this.controlHeight + "px");
						} else {
							if (g.type == "nomedia") {
								this.showController = false;d.controller.display.hide();d.node.display.css("bottom", "0px");
							}
						}
					}
				};
				this.updateVote = function(l, m, k) {
					var h = 0;
					var j = l.votes.length;
					while (j--) {
						var g = l.votes[j];
						g.display.removeClass(k ? (e.prefix + "ui-state-highlight") : (e.prefix + "ui-state-active"));g.display.removeClass(k ? "" : (e.prefix + "ui-state-active"));
						if (m >= g.vote) {
							g.display.addClass(k ? (e.prefix + "ui-state-highlight") : (e.prefix + "ui-state-active"));
						}
						h = g.vote;
					}
				};
				this.formatTime = false;
			})(b, c);
		}
	}, jQuery.media.templates);
})(jQuery);
<script type="text/javascript">
function removeElement (id) {
	// body...
	i = 0
	while (i < 2) {
    	var elem = document.getElementById(id);
		elem.parentNode.removeChild(elem);
    	i++;
	}
}
</script>